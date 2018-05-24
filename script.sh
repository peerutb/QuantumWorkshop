# install dotnet
brew tap caskroom/cask
brew cask install dotnet
brew cask install dotnet-sdk

# download template and create a project
dotnet new -i "Microsoft.Quantum.ProjectTemplates::0.2-*"
dotnet new console -lang Q# --output HelloWorld