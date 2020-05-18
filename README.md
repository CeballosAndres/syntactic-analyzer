
# Analizador sintáctico LALR

Ejemplo para comenzar a utilizar JFlex junto con Cup. Con código tomado de una práctica de la asignatura de Lenguajes y Autómatas I, del Tecnológico Nacional de México Campus Colima.

## Dependencias

Es necesario contar previamente con las siguientes instalaciones y dependencias. Está guía está pensada para ser implementada en **MacOS**, para otros sistemas operativos se hace referencia a documentaciones externas.

### JFlex

Puede ser instalado mediante [Brew][]. Otros sistemas operativos consultar [JFlex][].

```shell
brew install jflex
```

### Cup

Descargar la [versión 0.10k][] de Cup:

```shell
cd ~/Downloads && curl -o java_cup_v10k.tar.gz \
https://www.cs.princeton.edu/\~appel/modern/java/CUP/java_cup_v10k.tar.gz
```

Descomprimir y ubicar la subcarpeta *java_cup* dentro del directorio de trabajo o para MacOS:

```shell
tar vxf java_cup_v10k.tar.gz
```

También se recomienda compilar todos los archivos Java para generar las clases necesarias:

```shell
javac java_cup/*.java java_cup/runtime/*.java
```

Note: Será necesario ubicar *java_cup* en todos nuestros proyectos.

Todo el proceso se puede realizar con los comandos:

```shell
cd ~/Downloads \
&& curl -o java_cup_v10k.tar.gz https://www.cs.princeton.edu/\~appel/modern/java/CUP/java_cup_v10k.tar.gz \
&& tar vxf java_cup_v10k.tar.gz \
&& javac java_cup/*.java java_cup/runtime/*.java
```

## Generar el analizador

Clonar el repositorio:

```shell
git clone git@github.com:CeballosJAndres/syntactic-analyzer.git && cd syntactic-analyzer
```

Éste incluye tres archivos necesarios:

- Lexico.flex
- Sintactico.cup
- Main.java

`Lexico.flex` será usado como entrada para JFlex que nos generará un analizador léxico. `Sintactico.cup` de manera similar, será la entrada de Cup y como salida obtendremos un analizador sintáctico. Por último, el archivo `Main.java` servirá para como punto de entrada para realizar todo nuestro análisis. Además se incluyen unas pruebas para verificar el funcionamiento de nuestro analizador.

Como se mencionó antes, habrá que ubicar la carpeta *java_cup* dentro del directorio de trabajo:

```shell
cp -r ~/Downloads/java_cup java_cup
```

Indicamos a `java_cup.Main` cual es nuestra declaración de la gramática:

```shell
java java_cup.Main < Sintactico.cup
```

Generamos el *parser*:

```shell
jflex Lexico.flex
```

Compilamos nuestro archivo `Main.java`:

```shell
javac Main.java
```

Para verificar el proceso pueden ser usados los archivos `*.txt`:

```shell
java Main prueba.txt
```

Todo el proceso de generación del analizador se puede realiza con:

```shell
jflex Lexico.flex \
&& java java_cup.Main < Sintactico.cup \
&& javac Main.java \
&& java Main test_pass.txt \
&& java Main test_fail.txt
```

[Brew]: https://www.brew.sh
[JFlex]: https://jflex.de/download.html
[versión 0.10k]: https://www.cs.princeton.edu/~appel/modern/java/CUP/java_cup_v10k.zip
