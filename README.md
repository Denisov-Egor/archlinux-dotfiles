# Arch Linux Dotfiles

Мои конфигурационные файлы для **Arch Linux + Hyprland**.

> Минималистичная и воспроизводимая пользовательская конфигурация, управляемая с помощью Git и GitHub.

## ✦ Возможности

* Hyprland — Wayland-композитор
* Waybar — панель состояния
* Wofi — лаунчер приложений
* Kitty — терминал
* Neovim / VS Code — редакторы
* CAVA — аудиовизуализатор
* PipeWire + WirePlumber — аудиосистема
* SwayNC — система уведомлений
* Fastfetch — информация о системе
* Zellij — терминальный мультиплексор
* Ranger — файловый менеджер
* Zathura — PDF-ридер
* Конфигурация GTK 3 / GTK 4
* Управление конфигурацией через Git
* SSH-аутентификация для GitHub

## 🖥️ Окружение

| Компонент         | Программа              |
| ----------------- | ---------------------- |
| ОС                | Arch Linux             |
| Композитор        | Hyprland               |
| Терминал          | Kitty                  |
| Shell             | Bash / Zsh             |
| Редактор          | Neovim / VS Code       |
| Панель            | Waybar                 |
| Лаунчер           | Wofi                   |
| Уведомления       | SwayNC                 |
| Аудио             | PipeWire / WirePlumber |
| Файловый менеджер | Ranger / Dolphin       |
| Мультиплексор     | Zellij                 |
| PDF-ридер         | Zathura                |

## 📁 Структура репозитория

```text id="f1kq3a"
archlinux-dotfiles/
├── .config/
│   ├── autostart/
│   ├── btop/
│   ├── cava/
│   ├── cmus/
│   ├── Code/
│   ├── fastfetch/
│   ├── gtk-3.0/
│   ├── gtk-4.0/
│   ├── htop/
│   ├── hypr/
│   ├── kitty/
│   ├── mpv/
│   ├── nvim/
│   ├── nwg-look/
│   ├── ranger/
│   ├── systemd/
│   ├── waybar/
│   ├── wireplumber/
│   ├── wofi/
│   ├── xsettingsd/
│   ├── zathura/
│   └── zellij/
├── .gitignore
└── README.md
```

Репозиторий повторяет структуру пользовательской директории конфигурации:

```text id="5y9zqj"
~/.config/
```

Главное правило простое:

```text id="r7xw3m"
Здесь хранятся только конфигурационные файлы.
```

## 🚀 Установка

### 1. Клонирование репозитория

```bash id="f5p6yc"
git clone git@github.com:Denisov-Egor/archlinux-dotfiles.git \
    ~/archlinux-dotfiles
```

### 2. Резервная копия существующей конфигурации

```bash id="j2z8qv"
mv ~/.config ~/.config.backup
```

Создать новую директорию конфигурации:

```bash id="p3m8xb"
mkdir -p ~/.config
```

### 3. Установка dotfiles

```bash id="w8h3sk"
cp -a ~/archlinux-dotfiles/.config/. ~/.config/
```

Проверить:

```bash id="0gk1rm"
ls ~/.config
```

## 🔄 Обновление

Получить последнюю версию:

```bash id="6j1q8v"
cd ~/archlinux-dotfiles
git pull
```

Синхронизировать конфигурацию репозитория с системой:

```bash id="9p2q4w"
cp -a ~/archlinux-dotfiles/.config/. ~/.config/
```

После изменения конфигурации Hyprland:

```bash id="h4x8sk"
hyprctl reload
```

Для некоторых приложений может потребоваться перезапуск.

## 💾 Сохранение изменений

После изменения файлов в `~/.config` синхронизировать их обратно с репозиторием:

```bash id="3v8q1n"
cp -a ~/.config/. ~/archlinux-dotfiles/.config/
```

Проверить изменения:

```bash id="r6m2zp"
cd ~/archlinux-dotfiles
git status
```

Посмотреть изменения:

```bash id="c8x4mh"
git diff
```

Добавить изменения:

```bash id="k5w7qs"
git add .config
```

Создать commit:

```bash id="n2f9bd"
git commit -m "config: update dotfiles"
```

Отправить изменения на GitHub:

```bash id="y7m3kx"
git push
```

## 🧹 Проверка репозитория

Проверить состояние рабочей директории:

```bash id="t8q4vn"
git status
```

Посмотреть последние commit:

```bash id="z3m6pk"
git log --oneline --decorate -10
```

Посмотреть настроенные удалённые репозитории:

```bash id="w4n8sj"
git remote -v
```

Посмотреть текущую ветку:

```bash id="p7x2md"
git branch -vv
```

Перед созданием commit рекомендуется проверить добавленные изменения:

```bash id="q9k4rw"
git diff --cached
```

## 🔐 SSH-аутентификация

Доступ к GitHub осуществляется через SSH.

Проверить подключение:

```bash id="v6m3xt"
ssh -T git@github.com
```

При успешной аутентификации GitHub покажет:

```text id="c4z8qp"
Hi Denisov-Egor! You've successfully authenticated,
but GitHub does not provide shell access.
```

Проверить загруженные SSH-ключи:

```bash id="m8q2vk"
ssh-add -l
```

Приватный SSH-ключ **никогда не должен добавляться в этот репозиторий**.

Например:

```text id="s5n7cx"
~/.ssh/id_ed25519
```

должен оставаться за пределами репозитория.

## 🛡️ Безопасность

Этот репозиторий предназначен для хранения конфигурации, **а не секретов**.

Никогда не добавляйте:

* пароли;
* API-токены;
* приватные SSH-ключи;
* сертификаты, содержащие приватные ключи;
* cookies;
* session-файлы;
* базы данных;
* кэш приложений;
* логи;
* `.env`-файлы;
* учётные данные.

Перед каждым commit:

```bash id="j4p7zs"
git status
git diff --cached
```

Если конфиденциальный файл случайно попал в staging, удалите его из staging **до создания commit**.

## 📦 Что не хранится в репозитории

Репозиторий намеренно не содержит:

```text id="e3n9qx"
/home/<user>/
```

а также:

```text id="d7k2mv"
packages/
```

или:

```text id="x6p4zr"
aur-packages/
```

и полную системную конфигурацию.

Репозиторий сфокусирован исключительно на:

```text id="q8v5nc"
~/.config/
```

Это делает репозиторий более переносимым и предотвращает попадание в него специфичных для конкретной машины данных.

## 🔁 Рабочий процесс

```text id="b3k7xm"
              Локальная система
                     │
                     │
                ~/.config/
                     │
                     │ синхронизация
                     ▼
          ~/archlinux-dotfiles/
                     │
                     │ git commit
                     ▼
                    Git
                     │
                     │ git push
                     ▼
                  GitHub
```

Для восстановления конфигурации на другой установке Arch Linux:

```text id="q5m9zt"
GitHub
   │
   │ git clone
   ▼
~/archlinux-dotfiles/
   │
   │ копирование
   ▼
~/.config/
```

## 🎯 Принципы

Конфигурация строится вокруг нескольких простых принципов:

1. Минимализм системы.
2. Хранение конфигурации под контролем версий.
3. Секреты не хранятся в Git.
4. Минимум специфичных для конкретной машины файлов.
5. Воспроизводимая конфигурация.
6. Репозиторий сфокусирован исключительно на `.config`.

---

**Arch Linux · Hyprland · Wayland · Git**
