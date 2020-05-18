
# Analizador sintáctico LALR

Ejemplo para comenzar a utilizar JFlex junto con Cup, para la asignatura de Lenguajes y Autómatas I, del Tecnológico Nacional de México Campus Colima.

## Dependencias

Es necesario contar previamente con las siguientes instalaciones y dependencias. Se incluye la referencia a

### JFlex

Consultar [https://jflex.de/download.html](https://jflex.de/download.html) dependiendo el sistema operativo para su instalación.

Para **MacOS**, puede ser instalado con [brew](https://www.brew.sh), el cual realiza los enlaces al PATH por nosotros.

```bash
brew install jflex
```


## Cup

Ubicar la subcarpeta *java_cup* de la [versión 0.10k](https://www.cs.princeton.edu/~appel/modern/java/CUP/java_cup_v10k.zip) dentro del directorio de trabajo o para MacOS:

```bash
cd ~/Downloads && 
curl -o java_cup_v10k.tar.gz https://www.cs.princeton.edu/\~appel/modern/java/CUP/java_cup_v10k.tar.gz && 
tar vxf java_cup_v10k.tar.gz
```

## Analizador

Clonar el repositorio:

```bash
git clone git@github.com:CeballosJAndres/syntactic-analyzer.git && cd syntactic-analyzer
```

Copiar carpeta *java_cup* dentro del directorio de trabajo:

```bash
cp -r ~/Downloads/java_cup java_cup
```

Compilar archivos java:

```bash
javac java_cup/*.java java_cup/runtime/*.java
```

Generar el parser, enlazar con el analizador sintáctico, compilar archivos y realizar pruebas:

```bash
jflex Lexico.flex && java java_cup.Main < Sintactico.cup && javac Main.java && java Main test_pass.txt && java Main test_fail.txt
```
