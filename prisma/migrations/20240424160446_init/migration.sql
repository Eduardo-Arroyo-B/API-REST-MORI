-- CreateTable
CREATE TABLE "Categoria" (
    "idCategoria" SERIAL NOT NULL,
    "categoria" TEXT NOT NULL,

    CONSTRAINT "Categoria_pkey" PRIMARY KEY ("idCategoria")
);

-- CreateTable
CREATE TABLE "Subcategoria" (
    "idSubcategoria" SERIAL NOT NULL,
    "subcategoria" TEXT NOT NULL,
    "idCategoria" INTEGER NOT NULL,

    CONSTRAINT "Subcategoria_pkey" PRIMARY KEY ("idSubcategoria")
);

-- CreateTable
CREATE TABLE "Autor" (
    "idAutor" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "nacionalidad" TEXT NOT NULL,
    "correoElectronico" TEXT,

    CONSTRAINT "Autor_pkey" PRIMARY KEY ("idAutor")
);

-- CreateTable
CREATE TABLE "Titulo" (
    "idTitulo" SERIAL NOT NULL,
    "titulo" TEXT NOT NULL,
    "editorial" TEXT NOT NULL,
    "isbn" TEXT NOT NULL,
    "fechaPublicacion" TIMESTAMP(3) NOT NULL,
    "noEjemplares" INTEGER NOT NULL,
    "idSubcategoria" INTEGER NOT NULL,

    CONSTRAINT "Titulo_pkey" PRIMARY KEY ("idTitulo")
);

-- CreateTable
CREATE TABLE "TituloAutor" (
    "idAutor" INTEGER NOT NULL,
    "idTitulo" INTEGER NOT NULL,

    CONSTRAINT "TituloAutor_pkey" PRIMARY KEY ("idAutor","idTitulo")
);

-- AddForeignKey
ALTER TABLE "Subcategoria" ADD CONSTRAINT "Subcategoria_idCategoria_fkey" FOREIGN KEY ("idCategoria") REFERENCES "Categoria"("idCategoria") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Titulo" ADD CONSTRAINT "Titulo_idSubcategoria_fkey" FOREIGN KEY ("idSubcategoria") REFERENCES "Subcategoria"("idSubcategoria") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TituloAutor" ADD CONSTRAINT "TituloAutor_idAutor_fkey" FOREIGN KEY ("idAutor") REFERENCES "Autor"("idAutor") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TituloAutor" ADD CONSTRAINT "TituloAutor_idTitulo_fkey" FOREIGN KEY ("idTitulo") REFERENCES "Titulo"("idTitulo") ON DELETE RESTRICT ON UPDATE CASCADE;
