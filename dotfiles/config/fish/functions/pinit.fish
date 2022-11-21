function pinit -a 'language' -a 'packageName'
    # init a project with specific language
    if test -n "$language" -a -n "$packageName"

      set function_path "$HOME/.config/fish/functions/pinit/$language.fish"

      switch "$language"
        case "java"
          source $function_path
          pinit_java $packageName
        case "python"

        case "c" "cpp" "c++"

        case "*"
            echo "Language not support"
      end

      cd "$packageName"
      git init
      cd ..

    else

      echo missing arguments
      echo pinit {filename} {packageName}

    end
end

