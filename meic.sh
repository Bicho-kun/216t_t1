function meic_all {
  pdflatex --halt-on-error qft2_t1.tex
}

function push {
  echo qft2_t1.pdf -\> `hok -f qft2_t1.pdf`_qft2_t1.pdf
  cp qft2_t1.pdf `hok -f qft2_t1.pdf`_qft2_t1.pdf
}

function gitear {
  echo "# 216t_t1" >> README.md
  GIT_SSH_COMMAND='ssh -i ~/.ssh/your_private_key' git submodule update --init
  git init
  GIT_SSH_COMMAND='ssh -i ~/.ssh/your_private_key' git submodule update --init
  git add README.md
  git commit -m "first commit"
  git branch -M main
  git remote add origin git@github.com:Bicho-kun/216t_t1.git
  git push -u origin main
}

[ $# = 0 ] && meic_all || "$@"
