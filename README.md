# Bioinformatics and Algorithmic Problem Solvers

This repository contains a collection of scripts designed to solve common problems in bioinformatics and algorithmic puzzles. These Perl scripts can be utilized for DNA sequence analysis, optimization problems, and mathematical challenges.

## Table of Contents

1. [Scripts Overview](#scripts-overview)
2. [Requirements](#requirements)
3. [Usage](#usage)
4. [Scripts Description](#scripts-description)
5. [License](#license)

---

## Scripts Overview

| Script Name                      | Description                                  |
|----------------------------------|----------------------------------------------|
| `fibonacci_series_calculator.pl` | Generates Fibonacci series numbers.          |
| `tower_of_hanoi_solver.pl`       | Solves the Tower of Hanoi puzzle.            |
| `dna_distinct_substrings.pl`     | Finds all distinct substrings in DNA data.   |
| `hamming_distance_calculator.pl` | Calculates the Hamming distance between sequences. |
| `amino_acid_to_dna_converter.pl` | Converts amino acid sequences to DNA codons. |
| `global_alignment_wunsch.pl`     | Performs global sequence alignment using the Needleman-Wunsch algorithm. |
| `local_alignment_smith.pl`       | Performs local sequence alignment using the Smith-Waterman algorithm. |
| `edit_distance_calculator.pl`    | Computes edit distance between strings.      |
| `motif_identification_profile.pl`| Identifies motifs using profile matrices.    |
| `longest_common_subsequence.pl`  | Finds the longest common subsequence between strings. |
| `dna_fragment_assembly.pl`       | Assembles DNA fragments into sequences.      |

---

## Requirements

- **Perl**: Ensure you have Perl installed on your system. Most Unix-based systems come with Perl pre-installed.

## Usage

1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/bioinformatics-scripts.git
   cd bioinformatics-scripts
   ```

2. Run the scripts using Perl:
   ```bash
   perl script_name.pl
   ```

3. For scripts requiring input, provide the necessary arguments or input files as specified in the script comments.

---

## Scripts Description

### `fibonacci_series_calculator.pl`
Generates Fibonacci numbers up to a specified limit. Useful for sequence-based problems.

### `tower_of_hanoi_solver.pl`
Solves the Tower of Hanoi puzzle and outputs the steps required to move all disks from one peg to another.

### `dna_distinct_substrings.pl`
Analyzes a given DNA sequence and outputs all distinct substrings, aiding in sequence pattern recognition.

### `hamming_distance_calculator.pl`
Calculates the Hamming distance between two DNA or RNA sequences, measuring the number of differing nucleotides.

### `amino_acid_to_dna_converter.pl`
Converts amino acid sequences back into possible DNA codons, useful for reverse translation.

### `global_alignment_wunsch.pl`
Implements the Needleman-Wunsch algorithm for aligning two sequences globally.

### `local_alignment_smith.pl`
Implements the Smith-Waterman algorithm for local alignment of sequences.

### `edit_distance_calculator.pl`
Computes the minimum number of edits required to transform one string into another.

### `motif_identification_profile.pl`
Uses profile matrices to identify motifs in DNA sequences.

### `longest_common_subsequence.pl`
Finds the longest subsequence common to two given sequences.

### `dna_fragment_assembly.pl`
Reconstructs DNA sequences from smaller fragments using sequence overlaps.

---

## License

This repository is licensed under the MIT License. See the `LICENSE` file for details.

