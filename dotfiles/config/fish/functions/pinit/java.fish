function pinit_java -a 'packageName'
  set template "$HOME/.config/fish/project_templates/java"

  mvn -B archetype:generate -DgroupId="$packageName" -DartifactId="$packageName" \
      -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4
  cp -rT $template "$packageName" # use -T to also copy hidden files

  cd "$packageName"

  # change java sdk to 17
  sed -i "s/<maven.compiler.source>.*<\/maven.compiler.source>/<maven.compiler.source>17<\/maven.compiler.source>/" pom.xml
  sed -i "s/<maven.compiler.target>.*<\/maven.compiler.target>/<maven.compiler.target>17<\/maven.compiler.target>/" pom.xml

  # thirty party library comment
  set x (awk '/<dependencies>/{print NR}' pom.xml)
  
  sed -i ""$x"a     <!-- <dependency> -->\n\
<!-- <groupId></groupId> -->\n\
<!-- <artifactId></artifactId> -->\n\
<!-- <version>1.00</version> -->\n\
<!-- <scope>system</scope> -->\n\
<!-- <systemPath>\${basedir}/libs/xxx.jar</systemPath> -->\n\
<!-- </dependency> -->" pom.xml

  sed -i "s/#{packageName}#/$packageName/g" Makefile
  sed -i "s/#{packageName}#/$packageName/g" README.org

  cd ..

end

