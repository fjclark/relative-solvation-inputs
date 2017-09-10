windows=$(seq 0.00 0.05 1.00)

: > mbar.dat

for w in $windows; do
  if [ \! -x $w ]; then
    mkdir $w
  fi

  echo $w >> mbar.dat

  sed -e "s/%L%/$w/" ti.in.tmpl > $w/ti.in.tmpl

  (cd $w; ln -sf ../../../vdw.rst7 ti000.rst7; ln -sf ../mbar.dat)
done
