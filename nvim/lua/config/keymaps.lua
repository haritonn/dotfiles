local map = vim.keymap.set

map("n", "<C-h>", "<C-w>h", { desc = "Окно влево" })
map("n", "<C-l>", "<C-w>l", { desc = "Окно вправо" })
map("n", "<C-j>", "<C-w>j", { desc = "Окно вниз" })
map("n", "<C-k>", "<C-w>k", { desc = "Окно вверх" })

map("n", "<leader>sv", "<cmd>vsplit<cr>", { desc = "Вертикальный сплит" })
map("n", "<leader>sh", "<cmd>split<cr>", { desc = "Горизонтальный сплит" })
map("n", "<leader>se", "<C-w>=", { desc = "Выровнять окна" })
map("n", "<leader>sx", "<cmd>close<cr>", { desc = "Закрыть сплит" })

-- neotree
map("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Файловое дерево" })
map("n", "<leader>E", "<cmd>Neotree reveal<cr>", { desc = "Показать текущий файл" })

-- Telescope
map("n", "<leader>ff", function()
        require("telescope.builtin").find_files()
end, { desc = "Файлы" })
map("n", "<leader>fr", function()
        require("telescope.builtin").oldfiles()
end, { desc = "Недавние" })
map("n", "<leader>fb", function()
        require("telescope.builtin").buffers()
end, { desc = "Буферы" })
map("n", "<leader>fg", function()
        require("telescope.builtin").live_grep()
end, { desc = "Grep" })
map("n", "<leader>fw", function()
        require("telescope.builtin").grep_string()
end, { desc = "Слово под курсором" })
map("n", "<leader>fs", function()
        require("telescope.builtin").lsp_document_symbols()
end, { desc = "Символы файла" })
map("n", "<leader>fS", function()
        require("telescope.builtin").lsp_workspace_symbols()
end, { desc = "Символы проекта" })

vim.keymap.set("n", "<C-o>", "<C-o>", { desc = "Назад по jump list" })
-- Вперёд по jump list: используйте встроенный <C-i> (без отдельного маппинга на <C-m>,
-- чтобы не конфликтовать с Enter в терминале)
