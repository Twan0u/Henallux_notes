SRC=APM CBD CS EA JS OS RES SEMIN STAT

.SILENT:
.DEFAULT_GOAL=help
.PHONY: all clear $(SRC)
ESPACE_HELP=10

$(SRC): # Compile les notes en PDF

	echo $@/notes/chapitre*.md | xargs cat > temp_$@.md
	pandoc temp_$@.md -s -o $@.pdf
	echo $@
	rm temp_$@.md

all: $(SRC) ## Compile toutes les notes en PDF ( Pandoc and texlive sont requis )

install: ## instalation de pandoc et texlive

	sudo apt-get update && sudo apt-get upgrade
	sudo apt-get install pandoc
	sudo apt-get install texlive

clear: ## Supprime les fichiers temporaires non indispensables

	rm -f -- *.pdf
	rm -f -- temp_*.md

help: ## Affiche l'aide

	@grep -h -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-$(ESPACE_HELP)s\033[0m %s\n", $$1, $$2}'
