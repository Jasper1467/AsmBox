cd src

for i in *.asm; do
  echo "[Compiling] src/$i -> build/$i.o"
  nasm -f elf64 $i -o ../build/$i.o
done

cd ../build

for j in *.o; do
  echo "[Linking] $j -> build/bin/${j::-6}"
  ld $j -o bin/${j::-6}
done

