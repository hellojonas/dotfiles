require('user.lsp.nvim-jdtls').setup()

--[[ local install_path = os.getenv("HOME") .. '/.local/share/java/jdtls'
-- local jdtls_path = install_path .. '/bin/jdtls'
local jdtls_launcher = install_path .. '/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar'
local jdtls_config = install_path .. '/config_linux'


local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = os.getenv('HOME') .. '/workspace/' .. project_name

local lsp = require('user.lsp')

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {
    'java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-jar', jdtls_launcher,
    '-configuration', jdtls_config,
    '-data', workspace_dir
  },

  root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew' }),

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
      configuration = {
        -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
        -- And search for `interface RuntimeOption`
        -- The `name` is NOT arbitrary, but must match one of the elements from `enum ExecutionEnvironment` in the link above
        runtimes = {
          {
            name = "JavaSE-11",
            path = "/usr/lib/jvm/java-11-openjdk/",
          },
          {
            name = "JavaSE-17",
            path = "/usr/lib/jvm/java-17-openjdk/",
          },
          {
            name = "JavaSE-1.8",
            path = "/usr/lib/jvm/java-8-openjdk/",
          },
        }
      }
    }
  },

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = {}
  },
  on_attach = lsp.on_attach,
  flags = lsp.lsp_flags
} ]]
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
-- jdtls = require('jdtls')

-- jdtls.start_or_attach(config)
