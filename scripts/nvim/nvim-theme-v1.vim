set background=dark

" Цвет фона и текста
highlight Normal guibg=#282828 guifg=#ffffff  " Основной текст
highlight NonText guifg=#555555               " Невидимый текст (например, пробелы)
highlight LineNr guifg=#aaaaaa                 " Номера строк
highlight CursorLine guibg=#3c3c3c             " Цвет фона текущей строки

" Цвета для комментариев и строк
highlight Comment guifg=#888888                 " Комментарии
highlight String guifg=#00ff00                  " Строки
highlight Identifier guifg=#ff00ff              " Идентификаторы
highlight Function guifg=#00ffff                " Функции
highlight Error guibg=#ff0000 guifg=#ffffff    " Ошибки

" Жирный текст
highlight Bold guifg=#ffffff gui=bold           " Жирный текст
highlight Special guifg=#ffcc00                  " Специальные элементы

" Цвета для других видов текста
highlight Type guifg=#ffcc00                     " Типы
highlight Constant guifg=#ffcc00                 " Константы
highlight Statement guifg=#ffcc00                 " Утверждения
highlight PreProc guifg=#ffcc00                   " Предобработка
highlight Todo guifg=#ffffff guibg=#ff8800       " Заметки
