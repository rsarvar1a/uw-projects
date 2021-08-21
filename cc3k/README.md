# CC3K, a roguelike game.

CS246-S2020 final project by:
- rsarvaria@uwaterloo.ca
- d23moham@uwaterloo.ca
- qctaian@uwaterloo.ca

# How To Play

	./cc3k [--path=<>] [--floors=<5>] [--seed=<>] [--gen] [--demo] [--extraraces]

	..	--path="path/to/file"		: file to load the map layout from
	..	--floors=n			: specifies that the map file has n floors, with default 5
	.. 	--seed=s			: uses the seed s for the random generator
	..	--gen				: tells cc3k to generate the characters and enemies
	..	--demo				: adds a slight delay between actions to follow along with an input file
	..	--extraraces			: enables the bonus feature races
	
# Troubleshooting

This is a prebuilt binary for Linux; if you do not have the proper version of the boost library installed on your system, it will not run.

If you can obtain a copy of the correct boost library, put it into the root directory of this project, and run the following:

```bash
LD_LIBRARY_PATH="$PATH:." ./cc3k
```
