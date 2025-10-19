require('code_runner').setup({
  filetype = {
    java = "cd \"$dir\" && javac \"$fileName\" && java \"$fileNameWithoutExt\"",
    gthon = "python3 -u \"$file\"",
    c = "cd \"$dir\" && gcc \"$fileName\" -o \"/tmp/$fileNameWithoutExt\" && \"/tmp/$fileNameWithoutExt\" && rm \"/tmp/$fileNameWithoutExt\"",
    cpp = "cd \"$dir\" && g++ \"$fileName\" -o \"/tmp/$fileNameWithoutExt\" && \"/tmp/$fileNameWithoutExt\" && rm \"/tmp/$fileNameWithoutExt\"",
    kotlin = "cd \"$dir\" && kotlinc \"$fileName\" -include-runtime -d \"/tmp/$fileNameWithoutExt.jar\" && java -jar \"/tmp/$fileNameWithoutExt.jar\" && rm \"/tmp/$fileNameWithoutExt.jar\"",
    },
})
