-- Создание таблицы "Издания"
CREATE TABLE Издания (
    индекс_издания SERIAL PRIMARY KEY,
    название_издания VARCHAR(255) NOT NULL,
    вид_издания VARCHAR(50) NOT NULL,
    цена_1_экземпляра DECIMAL(10, 2) NOT NULL
);

-- Создание таблицы "Получатели"
CREATE TABLE Получатели (
    идентификатор_получателя SERIAL PRIMARY KEY,
    фио_подписчика VARCHAR(255) NOT NULL,
    улица VARCHAR(255) NOT NULL,
    номер_дома VARCHAR(10) NOT NULL,
    номер_квартиры VARCHAR(10) NOT NULL
);

-- Создание таблицы "Подписки"
CREATE TABLE Подписки (
    идентификатор_подписки SERIAL PRIMARY KEY,
    идентификатор_получателя INT,
    индекс_издания INT,
    дата_начала_подписки DATE NOT NULL,
    срок_подписки INT NOT NULL,
    стоимость_подписки DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (идентификатор_получателя) REFERENCES Получатели(идентификатор_получателя),
    FOREIGN KEY (индекс_издания) REFERENCES Издания(индекс_издания)
);

-- Создание таблицы "Доставка"
CREATE TABLE Доставка (
    идентификатор_доставки SERIAL PRIMARY KEY,
    идентификатор_подписки INT,
    дата_доставки DATE NOT NULL,
    стоимость_доставки DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (идентификатор_подписки) REFERENCES Подписки(идентификатор_подписки)
);
