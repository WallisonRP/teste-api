-- CreateTable
CREATE TABLE "User" IF NOT EXISTS(
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tb_distribuidor" IF NOT EXISTS(
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "endereco_id" TEXT NOT NULL,
    "contato_id" TEXT NOT NULL,

    CONSTRAINT "tb_distribuidor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tb_contato" IF NOT EXISTS(
    "id_contato" TEXT NOT NULL,
    "email" TEXT,
    "telefone" TEXT,
    "whatsapp" TEXT,
    "site" TEXT,

    CONSTRAINT "tb_contato_pkey" PRIMARY KEY ("id_contato")
);

-- CreateTable
CREATE TABLE "tb_endereco" IF NOT EXISTS(
    "id_endereco" TEXT NOT NULL,
    "logradouro" TEXT NOT NULL,
    "numero" TEXT NOT NULL,
    "complemento" TEXT,
    "estado" TEXT NOT NULL,
    "cidade" TEXT NOT NULL,
    "bairro" TEXT NOT NULL,
    "cep" TEXT NOT NULL,

    CONSTRAINT "tb_endereco_pkey" PRIMARY KEY ("id_endereco")
);

-- CreateTable
CREATE TABLE "tb_teste" IF NOT EXISTS(
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "idade" INTEGER NOT NULL,

    CONSTRAINT "tb_teste_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "estados" IF NOT EXISTS(
    "id" TEXT NOT NULL,
    "dados" JSONB NOT NULL,

    CONSTRAINT "estados_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "tb_distribuidor_endereco_id_key" ON "tb_distribuidor"("endereco_id");

-- CreateIndex
CREATE UNIQUE INDEX "tb_distribuidor_contato_id_key" ON "tb_distribuidor"("contato_id");

-- CreateIndex
CREATE UNIQUE INDEX "tb_teste_nome_key" ON "tb_teste"("nome");

-- AddForeignKey
ALTER TABLE "tb_distribuidor" ADD CONSTRAINT "tb_distribuidor_contato_id_fkey" FOREIGN KEY ("contato_id") REFERENCES "tb_contato"("id_contato") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tb_distribuidor" ADD CONSTRAINT "tb_distribuidor_endereco_id_fkey" FOREIGN KEY ("endereco_id") REFERENCES "tb_endereco"("id_endereco") ON DELETE RESTRICT ON UPDATE CASCADE;

