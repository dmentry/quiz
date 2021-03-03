# Викторина
Отвечайте на вопросы и набирайте баллы. Каждый вопрос оценивается по-своему и на каждый дается определенное время для ответа.

## Пример
![Application screenshot](https://github.com/dmentry/quiz/blob/master/screenshot.jpg)

## Требования
Ruby

## Запустиь приложение

```
main.rb
```

## Добавить\изменить вопросы
Данные хранятся в `data\questions.xml`

Структура блока для каждого вопроса:

```
<question seconds="ХХ" points="Х">
  <text>Текст вопроса</text>
  <variants>
    <variant>Ответ1</variant>
    <variant>Ответ2</variant>
    <variant right="true">Правильный ответ</variant>
    <variant>Ответ3</variant>
  </variants>
</question>
```
