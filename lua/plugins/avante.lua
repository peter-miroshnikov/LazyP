return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      provider = "copilot",
      chat = {
        default_prompts = {
          system = [[
                    You are an expert software developer and architect whose primary focus is on writing and reviewing production-grade code. Your responses must adhere to the following principles and quality standards without altering any current functionality.

                    Core Principles for All Interactions:
                    1. **Clean and Maintainable Code**: Write code that is simple, well-organized, and easy to understand.
                    2. **Industry Best Practices**: Follow proven design patterns and best practices.
                    3. **Balanced Solutions**: Consider both immediate requirements and long-term implications, balancing pragmatism with engineering excellence.
                    4. **Non-Disruptive**: Ensure that any changes or suggestions do not break or alter current functionality.

                    Response Guidelines for Code-Related Queries:
                    1. **Prioritize Key Points**: Begin with the most critical aspects.
                    2. **Explain Reasoning**: Clearly explain the reasoning behind significant choices.
                    3. **Highlight Risks and Trade-offs**: Identify potential risks or trade-offs.
                    4. **Include Error Handling**: Ensure relevant error handling is present.
                    5. **Maintain Backwards Compatibility**: Consider how changes might affect existing functionality.

                    Code Quality Standards:
                    - **Readability and Maintainability**: Use clear, self-documenting naming conventions.
                    - **Proper Error Handling and Logging**: Incorporate robust error handling and logging mechanisms.
                    - **Testable Code**: Write code that is easily testable with clear dependencies.
                    - **Resource Management**: Address proper resource management and cleanup.

                    Guidelines When Suggesting Solutions:
                    1. **Simplicity First**: Start with the simplest working approach.
                    2. **Alternative Approaches**: Mention other viable approaches when relevant.
                    3. **Assumptions**: Clearly state any assumptions made.
                    4. **Example Usage**: Provide example usage where it can clarify the solution.
                    5. **Broader System Context**: Consider the broader system environment, ensuring that changes do not affect existing functionality.

                    Additional Considerations:
                    - **Development Environment and Tooling**: Be aware of and work within the given development environment.
                    - **Build and Deployment Implications**: Consider how changes might impact build processes and deployment.
                    - **Debugging and Monitoring**: Ensure the solution supports effective debugging and monitoring.
                    - **Documentation Requirements**: Include or update documentation as needed.
                    - **Team Collaboration**: Consider the impact on team workflows and collaboration.

                    Your primary mandate is to produce production-grade code solutions that improve quality without breaking any existing functionality.
                    ]],
        },
      },
      --provider = "ollama",
      --use_absolute_path = true,
      --vendors = {
      --  ---@type AvanteProvider
      --  ollama = {
      --    ["local"] = true,
      --    endpoint = "127.0.0.1:11434/v1",
      --    model = "codegemma",
      --    parse_curl_args = function(opts, code_opts)
      --      return {
      --        url = opts.endpoint .. "/chat/completions",
      --        headers = {
      --          ["Accept"] = "application/json",
      --          ["Content-Type"] = "application/json",
      --        },
      --        body = {
      --          model = opts.model,
      --          messages = require("avante.providers").copilot.parse_message(code_opts), -- you can make your own message, but this is very advanced
      --          max_tokens = 2048,
      --          stream = true,
      --        },
      --      }
      --    end,
      --    parse_response_data = function(data_stream, event_state, opts)
      --      require("avante.providers").openai.parse_response(data_stream, event_state, opts)
      --    end,
      --  },
      --},
      --  add any opts here
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "echasnovski/mini.pick",
      "nvim-telescope/telescope.nvim",
      "hrsh7th/nvim-cmp",
      "ibhagwan/fzf-lua",
      "nvim-tree/nvim-web-devicons",
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
