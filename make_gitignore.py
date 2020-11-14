import sys

repository_name = str(sys.argv[1])

with open("Documents/GitHubProjects/RepoAutomations/gitignore.txt") as f:
    with open('Documents/GitHubProjects/%s/.gitignore' % (repository_name), "w") as f1:
        for line in f:
            f1.write(line)