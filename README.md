# local-llm-stack

Docker stack for local LLM labs with Ollama, Open-WebUI, and a core set of supporting Docker integrations.

## Project Goal

The goal of this project is to build a local LLM (Large Language Model) stack that includes Ollama and Open-WebUI, with plans to add more supporting Docker containers in the future. This stack is designed to be easily deployable and manageable, providing a robust environment for local LLM development and experimentation.

## Features

- **Ollama**: A service for managing and deploying LLM models.
- **Open-WebUI**: A web-based interface for interacting with LLM models.
- **Portainer Compatibility**: The stack is compatible with Portainer, making it easy to manage Docker containers through a graphical interface.

## Getting Started

1. Clone the repository:
    ```sh
    git clone https://github.com/Trebron74/local-llm-stack.git
    cd local-llm-stack
    ```

2. Configure the environment variables:
    - Copy the `.env.template` to `.env` and update the values as needed.
    ```sh
    cp .env.template .env
    ```
    - Create a symbolic link from `.env` to `stack.env`:
    ```sh
    ln -s stack.env .env
    ```

3. Deploy the stack using Docker Compose:
    ```sh
    docker-compose -f compose.yaml up -d
    ```

4. Access the services:
    - With variables:
      - Ollama API: `http://localhost:${OLLAMA_WEBAPI_PORT}`
      - Open-WebUI: `http://localhost:${OPEN_WEBUI_PORT}`
    - With actual values from `.env`:
      - Ollama API: `http://localhost:11434`
      - Open-WebUI: `http://localhost:3000`

## Portainer Compatibility

When using Portainer, ensure that the environment file is named `stack.env` as Portainer expects this naming convention. If the symbolic link does not work, make sure the content of the `.env` file is present in the `stack.env` file for Portainer to work properly.

## Future Plans

- Add more supporting Docker containers to enhance the functionality of the stack.
- Improve documentation and provide examples for common use cases.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request with your improvements.

## License

This project is licensed under the MIT License.
