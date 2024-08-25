# GIOS Bootstrap

Bootstrap codebase to quickly get the GIOS development environment up and running. 

## Development Environment with GitHub Codespaces

This project is configured to work seamlessly with GitHub Codespaces using a development container. The `.devcontainer/devcontainer.json` file defines the environment, ensuring that all necessary tools and extensions are available.

### Running in GitHub Codespaces

1. Open the project in GitHub Codespaces.
2. The development container will be automatically built and configured according to the `Dockerfile` and `setup.sh`.
3. Create a `lib` directory and Run `git clone https://github.com/nemequ/munit.git lib/munit`
4. Run `make run` to run the program. You should see it output `Hello, World!`

## Project Structure

The project is organized into the following directories:

```
project/
├── include/              # Header files
│   └── hello.h
├── src/                  # Source files
│   ├── main.c            # Main entry point of the program
│   └── hello.c
├── tests/                # Unit tests
│   └── test_hello.c
├── lib/                  # External libraries
│   └── munit/            # Munit testing framework (munit.h, munit.c)
├── build/                # Build output directory (e.g., executables, object files)
├── .devcontainer/        # Development container configuration
│   └─- devcontainer.json # Configuration for GitHub Codespaces
├── Dockerfile            # Dockerfile for setting up the development environment
├── setup.sh              # Script to set up the environment in the Docker container
├── Makefile              # Build instructions
└── README.md             # Project description
```

## Getting Started

### Building the Project

To compile the project, run:

```bash
make
```

This will compile the source files and generate the executable in the `build/` directory.

### Running the Program

To run the compiled program, use:

```bash
make run
```

This will execute the `main` program, which calls the `say_hello()` function to print "Hello, World!".

### Running Unit Tests

To run the unit tests, use:

```bash
make test
```

This will compile and run the tests using the `munit` framework, verifying that the `say_hello()` function behaves as expected.

### Cleaning Up

To remove all build artifacts, run:

```bash
make clean
```

This will delete all files in the `build/` directory.
