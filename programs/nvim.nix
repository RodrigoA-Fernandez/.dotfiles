{home,pkgs, ...}:
{
    home.packages = [
        pkgs.jdt-language-server
    ];
    # home.file.".config/nvim/lua/custom/plugins/jdtls.lua".text = ''
    # return {
    #   'mfussenegger/nvim-jdtls',
    #   ft = { 'java' },
    #   config = function()
    #     local config = {
    #       cmd = { '/bin/jdtls' },
    #       root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.iml', '.git', 'mvnw' }, { upward = true })[1]),
    #     }
    #      local workspace = vim.fs.dirname(vim.fs.find({'gradlew', '.iml','.git', 'mvnw'}, { upward = true })[1]);
    #     local config = {
    #       -- The command that starts the language server
    #       -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
    #       cmd = {
    #
    #         'java', 
    #         '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    #         '-Dosgi.bundles.defaultStartLevel=4',
    #         '-Declipse.product=org.eclipse.jdt.ls.core.product',
    #         '-Dlog.protocol=true',
    #         '-Dlog.level=ALL',
    #         '-Xmx1g',
    #         '--add-modules=ALL-SYSTEM',
    #         '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    #         '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    #
    #         '-jar', '${pkgs.jdt-language-server}/share/java/jdtls/plugins/org.eclipse.equinox.launcher_1.6.700.v20231214-2017.jar',
    #
    #         '-configuration', '${pkgs.jdt-language-server}/config_linux',
    #
    #
    #         '-data', '..workspace..'
    #       },
    #
    #       root_dir = require('jdtls.setup').find_root({'.git', '.iml','mvnw', 'gradlew'}),
    #
    #       -- Here you can configure eclipse.jdt.ls specific settings
    #       -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
    #       -- for a list of options
    #       settings = {
    #         java = {
    #         }
    #       },
    #
    #       -- Language server `initializationOptions`
    #       -- You need to extend the `bundles` with paths to jar files
    #       -- if you want to use additional eclipse.jdt.ls plugins.
    #       --
    #       -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
    #       --
    #       -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
    #       init_options = {
    #         bundles = {}
    #       },
    #     }
    #     require('jdtls').start_or_attach(config)
    #   end,
    # }
    # '';
}
