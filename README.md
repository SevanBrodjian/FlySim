# Fly Genetic Simulator

Fly Genetic Simulator is a fun and educational interactive simulation that allows users to explore the principles of Mendelian genetics, inheritance patterns, and the impact of dominance, incomplete dominance, and sex-linked traits in the offspring of two parent flies. The simulation is created using the Processing language, and it visually displays the flies on the screen with random movements and user control.

## Features

- Selection of two parent flies with customizable alleles for size (small vs. big) and color (white vs. red).
- Control over dominant traits (large/small and white/red), lethal dominant heterozygous gene combinations, incomplete dominance, and sex-linked traits.
- Visualization of ~10,000 offspring with calculated population data after each mating.
- Ability to select two offspring and observe the resulting population and calculations.

## Usage

1. At the start, select two parent flies to breed. Choose the alleles (2 each) for size (small vs. big) and color (white and red).
2. For both size and color, select which gene is dominant (large/small and white/red), whether the dominant heterozygous gene combo is deadly, whether there is incomplete dominance, and whether the traits are sex-linked.
3. Press the space bar to see the two parent flies displayed.
4. Press space again to mate them and see the ~10,000 offspring with calculations done on populations.
5. Press space again to select two of the offspring to mate together, choosing from the four combinations of white-small, white-large, red-small, and red-large for both the male and female.
6. Press space to see the final population of ~10,000 new offspring with calculations done again.

## Fly Class

The core functionality of the simulation is provided by the Fly class, which includes methods for setting alleles, displaying the fly, updating population counts, and controlling the fly's movement.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
