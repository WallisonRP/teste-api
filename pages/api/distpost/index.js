import { data2 } from '../../../data2.js'

import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

export default async function handler(req, res) {
    const { nome, logradouro, numero, bairro, complemento, cep, estado, cidade, telefone, email, whatsapp, site } = req.body;
    const allUsers = await prisma.estados.findMany()

    const estados = await prisma.estados.create({
      data: {
        dados: req.body
      }
    });

    console.log(req.body)
    

    res.status(200).json(allUsers)
}


/*

    const transaction = await prisma.$transaction(async (prisma) => {
        
    
        const endereco = await prisma.tb_endereco.create({
          data: {
            logradouro: logradouro,
            numero: numero,
            bairro: bairro,
            complemento: complemento,
            cep: cep,
            cidade: cidade,
            estado: estado
          }
        });

        const contato = await prisma.tb_contato.create({
          data: {
            email: email,
            telefone: telefone,
            whatsapp: whatsapp,
            site: site
          }
        });

        const distribuidor = await prisma.tb_distribuidor.create({
            data: {
              name: nome,
              endereco_id: endereco.id,
              contato_id: contato.id,
            }
          });
    
        return { distribuidor, endereco, contato };
      });

      console.log('Distribuidor:', transaction.distribuidor);
      console.log('Endereço:', transaction.endereco);
      console.log('Contato:', transaction.contato);
*/


/*
  try {
    const distribuidor = await prisma.tb_distribuidor.create({
      data: {
        name: 'ESCRITÓRIO BRASIL ENGRENAGENS',
        tb_endereco: {
          create: {
            // Dados do endereço
          }
        },
        tb_contato: {
          create: {
            // Dados do contato
          }
        }
      },
      include: {
        tb_endereco: true,
        tb_contato: true
      }
    });

    console.log('Distribuidor criado:', distribuidor);
  } catch (error) {
    console.error('Erro ao criar dados:', error);
  } finally {
    await prisma.$disconnect();
  }
*/