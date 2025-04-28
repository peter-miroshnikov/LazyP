--if true then return {} end

return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      provider = "copilot",
      --provider = "claude",
      --claude = {
      --  endpoint = "https://api.anthropic.com",
      --  model = "claude-3-5-sonnet-20241022",
      --  timeout = 30000, -- Timeout in milliseconds
      --  temperature = 0,
      --  max_tokens = 8000,
      --},
      copilot = {
        endpoint = "https://api.githubcopilot.com",
        --model = "gpt-4o-2024-08-06",
        model = "claude-3.7-sonnet",
        proxy = nil, -- [protocol://]host[:port] Use this proxy
        allow_insecure = false, -- Allow insecure server connections
        timeout = 30000, -- Timeout in milliseconds
        temperature = 0,
        max_tokens = 4096,
      },
      azure = {
        endpoint = "https://tms-ai-dev.openai.azure.com", -- example: "https://<your-resource-name>.openai.azure.com"
        deployment = "o1-mini", -- Azure deployment name (e.g., "gpt-4o", "my-gpt-4o-deployment")
        api_version = "2024-12-01-preview",
        timeout = 30000, -- Timeout in milliseconds
        temperature = 0,
        max_tokens = 4096,
      },
      --dual_boost = {
      --  enabled = false,
      --  first_provider = "azure",
      --  second_provider = "copilot",
      --  prompt = "Based on the two reference outputs below, generate a response that incorporates elements from both but reflects your own judgment and unique perspective. Do not provide any explanation, just give the response directly. Reference Output 1: [{{provider1_output}}], Reference Output 2: [{{provider2_output}}]",
      --  timeout = 60000, -- Timeout in milliseconds
      --},
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
