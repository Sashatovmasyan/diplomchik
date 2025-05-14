!/bin/bash


# Проверка, что Python установлен
if ! command -v python3 &> /dev/null; then
    echo "Python3 не установлен. Установите Python3 перед продолжением."
    exit 1
fi

# Проверка, что pip установлен
if ! command -v pip3 &> /dev/null; then
    echo "pip3 не установлен. Установите pip3 перед продолжением."
    exit 1
fi

# Создание виртуальное окружение
echo "Создание виртуального окружения..."
python3 -m venv venv

# Активация виртуального окружения
echo "Активация виртуального окружения..."
venv\Scripts\activate 

# Обновление pip до последней версии
echo "Обновление pip..."
pip3 install --upgrade pip

# Устанавливаем зависимости из requirements.txt
echo "Установка зависимостей из requirements.txt..."
pip3 install -r requirements.txt
pip3 install django mysqlclient

# Проверка успешности установки
if [ $? -eq 0 ]; then
    echo "Все зависимости успешно установлены!"
else
    echo "Произошла ошибка при установке зависимостей."
    exit 1
fi

#Создание Django проекта
django-admin startproject dental_clinic
cd dental_clinic
python manage.py startapp dental_clinic

# Деактивируем окружение 
deactivate

echo "Готово! Виртуальное окружение создано в папке 'venv'."
echo "Или: venv\Scripts\activate "