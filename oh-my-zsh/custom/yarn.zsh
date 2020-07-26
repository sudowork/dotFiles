if command -v yarn &> /dev/null; then
  path=("$(yarn global dir)" $path)
fi

