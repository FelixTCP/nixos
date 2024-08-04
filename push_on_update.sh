#!/home/felix/.nix-profile/bin/zsh

LIGHT_GREEN='\033[1;32m'
NC='\033[0m' # No Color
echo -e "\n${LIGHT_GREEN}Starting Git Sync${NC}\n"

# Function to generate a random 8-character string to tell commits apart
generate_random_commit_hash() {
    local chars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    local str=""
    for ((i=0; i<8; i++)); do
        str+="${chars:$((RANDOM % ${#chars})):1}"
    done
    echo "$str"
}

# Navigate to the target directory
cd ~/.config/nixos/

# Initialize the Git repository if it hasn't been initialized yet
if [ ! -f .git ]; then
    git init
fi

# Add all changes to the staging area
git add .

# Generate a random string for the commit message
commit_message=$(generate_random_commit_hash)
# Commit the changes with the random string as the message
git commit -m "Update nixos configuration ($commit_message)"

# Push the changes to the remote repository
git push origin main

echo -e "\n${LIGHT_GREEN}Successfully Updated all Nix Files${NC}"
