return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text',
      'nvim-neotest/nvim-nio',
      'williamboman/mason.nvim',
    },
    config = function()
      local dap = require 'dap'
      local ui = require 'dapui'

      require('dapui').setup()
      require('nvim-dap-virtual-text').setup()

      dap.adapters.chrome = {
        type = 'executable',
        command = 'node',
        args = { os.getenv 'HOME' .. '/.local/share/nvim/mason/packages/chrome-debug-adapter/out/src/chromeDebug.js' },
      }
      dap.adapters.delve = {
        type = 'server',
        host = '127.0.0.1',
        port = 38697,
      }

      dap.configurations.javascriptreact = {
        {
          type = 'chrome',
          request = 'launch',
          name = 'Launch in Brave',
          webRoot = '${workspaceFolder}',
          runtimeExecutable = '/snap/bin/brave',
          sourceMaps = true,
          userDataDir = true,
          url = function()
            local co = coroutine.running()
            return coroutine.create(function()
              vim.ui.input({
                prompt = 'Enter URL: ',
                default = 'http://localhost:3000',
              }, function(url)
                if url == nil or url == '' then
                  return
                else
                  coroutine.resume(co, url)
                end
              end)
            end)
          end,
        },
      }
      dap.configurations.typescriptreact = {
        {
          type = 'chrome',
          request = 'launch',
          name = 'Launch in Brave',
          webRoot = '${workspaceFolder}',
          runtimeExecutable = '/snap/bin/brave',
          sourceMaps = true,
          userDataDir = true,
          url = function()
            local co = coroutine.running()
            return coroutine.create(function()
              vim.ui.input({
                prompt = 'Enter URL: ',
                default = 'http://localhost:3000',
              }, function(url)
                if url == nil or url == '' then
                  return
                else
                  coroutine.resume(co, url)
                end
              end)
            end)
          end,
        },
      }
      dap.configurations.go = {
        {
          type = 'delve',
          name = 'Debug',
          mode = 'remote',
          request = 'attach',
          program = '${file}',
        },
      }

      vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint)
      vim.keymap.set('n', '<leader>gb', dap.run_to_cursor)

      -- Eval var under cursor
      vim.keymap.set('n', '<leader>?', function()
        require('dapui').eval(nil, { enter = true })
      end)

      vim.keymap.set('n', '<F1>', dap.continue)
      vim.keymap.set('n', '<F2>', dap.step_into)
      vim.keymap.set('n', '<F3>', dap.step_over)
      vim.keymap.set('n', '<F4>', dap.step_out)
      vim.keymap.set('n', '<F5>', dap.step_back)
      vim.keymap.set('n', '<F6>', dap.restart)

      dap.listeners.before.attach.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        ui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        ui.close()
      end
    end,
  },
}
