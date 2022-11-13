function pinit -a 'language' -a 'packageName'
    # init a project with specific language
    if test -n "$language" -a -n "$packageName"

      set template "$HOME/.config/fish/project_templates/$language"

      switch "$language"
        case "java"
            mvn -B archetype:generate -DgroupId="$packageName" -DartifactId="$packageName" -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4
            cp -rT $template "$packageName"

            cd "$packageName"

            # change java sdk to 17
            sed -i "s/<maven.compiler.source>.*<\/maven.compiler.source>/<maven.compiler.source>17<\/maven.compiler.source>/" pom.xml
            sed -i "s/<maven.compiler.target>.*<\/maven.compiler.target>/<maven.compiler.target>17<\/maven.compiler.target>/" pom.xml

            # thirty party
            set x (awk '/<dependencies>/{print NR}' pom.xml)
            
            sed -i ""$x"a     <!-- <dependency> -->\n\
<!-- <groupId></groupId> -->\n\
<!-- <artifactId></artifactId> -->\n\
<!-- <version>1.00</version> -->\n\
<!-- <scope>system</scope> -->\n\
<!-- <systemPath>\${basedir}/libs/xxx.jar</systemPath> -->\n\
<!-- </dependency> -->" pom.xml

            cd ..
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

