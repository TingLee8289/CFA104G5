<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
    
<style>
        @import url("https://rsms.me/inter/inter.css");

        :root {
        --color-gray: #737888;
        --color-lighter-gray: #e3e5ed;
        --color-light-gray: #f7f7fa;
        }

        *,
        *:before,
        *:after {
        box-sizing: inherit;
        }

        html {
        font-family: "Inter", sans-serif;
        font-size: 14px;
        box-sizing: border-box;
        }

        @supports (font-variation-settings: normal) {
        html {
            font-family: "Inter var", sans-serif;
        }
        }

        body {
        margin: 0;
        }

        h1 {
        margin-bottom: 1rem;
        }

        p {
        color: var(--color-gray);
        }

        hr {
        height: 1px;
        width: 100%;
        background-color: var(--color-light-gray);
        border: 0;
        margin: 2rem 0;
        }

        .container {
        max-width: 40rem;
        padding: 10vw 2rem 0;
        margin: 0 auto;
        height: 100vh;
        }

        .form {
        display: grid;
        grid-gap: 1rem;
        }

        .field {
        width: 100%;
        display: flex;
        flex-direction: column;
        border: 1px solid var(--color-lighter-gray);
        padding: .5rem;
        border-radius: .25rem;
        }

        .field__label {
        color: var(--color-gray);
        font-size: 0.6rem;
        font-weight: 300;
        text-transform: uppercase;
        margin-bottom: 0.25rem
        }

        .field__input {
        padding: 0;
        margin: 0;
        border: 0;
        outline: 0;
        font-weight: bold;
        font-size: 1rem;
        width: 100%;
        -webkit-appearance: none;
        appearance: none;
        background-color: transparent;
        }
        .field:focus-within {
        border-color: #000;
        }

        .fields {
        display: grid;
        grid-gap: 1rem;
        }
        .fields--2 {
        grid-template-columns: 1fr 1fr;
        }
        .fields--3 {
        grid-template-columns: 1fr 1fr 1fr;
        }

        .button {
        background-color: #000;
        text-transform: uppercase;
        font-size: 0.8rem;
        font-weight: 600;
        display: block;
        color: #fff;
        width: 100%;
        padding: 1rem;
        border-radius: 0.25rem;
        border: 0;
        cursor: pointer;
        outline: 0;
        }
        .button:focus-visible {
        background-color: #333;
        }
    </style>
</head>
<body>
	<div class="container">
        <h1>寄送資訊</h1>
        <div class="form">
          <div class="fields fields--2">
            <label class="field">
              <span class="field__label" for="name">全名</span>
              <input class="field__input" type="text" id="name" value="" />
            </label>
            <label class="field">
              <span class="field__label" for="phone">電話號碼</span>
              <input class="field__input" type="text" id="phone" value="" />
            </label>
          </div>
          <div class="fields fields--3">
            <label class="field">
              <span class="field__label" for="county">縣市</span>
              <input class="field__input" type="text" id="county" />
            </label>
            <label class="field">
              <span class="field__label" for="dist">區域</span>
              <select class="field__input" id="dist">
                <option value=""></option>
              </select>
            </label>
            <label class="field">
              <span class="field__label" for="zipcode">郵遞區號</span>
              <input class="field__input" type="text" id="zipcode" />
            </label>
          </div>
          <label class="field">
            <span class="field__label" for="address">地址</span>
            <input class="field__input" type="text" id="address" />
          </label>
          <label class="field">
            <span class="field__label" for="notes">備註</span>
            <input class="field__input" type="textarea" id="notes" />
          </label>
          
        </div>
        <hr>
        <button class="button">繼續填寫付款方式</button>
     </div>
</body>
</html>