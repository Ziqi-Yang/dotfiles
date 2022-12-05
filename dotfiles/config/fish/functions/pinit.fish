function pinit -a 'language' -a 'packageName'
    # init a project with specific language
    if test -n "$language" -a -n "$packageName"

      set function_path "$HOME/.config/fish/functions/pinit/$language.fish"

      if test -e $function_path
          source $function_path
      else
          echo "Language not support"
          return -1
      end

      switch "$language"
        case "java"
            pinit_java $packageName
        case "python"

        case "cc"
            pinit_cc $packageName
        case "rust"
            pinit_rust $packageName
        case "latex"
            pinit_latex $packageName
        case "*"
            echo "Language not support"
            return -1
      end

      cd "$packageName"
      git init
      cd ..

    else

      echo missing arguments
      echo pinit {filename} {packageName}

    end
end

