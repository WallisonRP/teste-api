import { data2 } from '../../../data2.js'

import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

export default async function handler(req, res) {
    const allUsers = await prisma.estados.findMany()
    console.log(allUsers)
    res.status(200).json(allUsers)
}

