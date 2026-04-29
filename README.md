# 🛡️ SafeRadar

Aplicativo mobile em desenvolvimento para **detecção de golpes digitais** utilizando inteligência artificial.

O sistema analisa mensagens e imagens para identificar possíveis fraudes, como phishing e engenharia social.

---

## 🚧 Status do Projeto

🔨 Em desenvolvimento (fase inicial)

---

## 📱 Sobre o Projeto

O **SafeRadar** tem como objetivo auxiliar usuários na identificação de golpes digitais por meio de análises automatizadas.

A aplicação atua como um “antivírus de engenharia social”, funcionando de duas formas:

* **Reativa:** análise manual de mensagens e imagens
* **Proativa:** alertas baseados em padrões suspeitos

---

## 🧱 Arquitetura

O sistema é dividido em:

### 📲 Mobile

* Flutter
* Dart
* Arquitetura MVVM
* Provider (gerenciamento de estado)

### 🌐 Backend (em desenvolvimento)

* Node.js
* API REST
* Integração com serviço de IA

### 🗄️ Banco de Dados (em definição)

* Armazenamento de histórico
* Base de golpes

---

## 📂 Estrutura do Projeto

```bash
lib/
 ├── core/
 │    └── theme/
 │
 ├── features/
 │    ├── auth/
 │    │    ├── model/
 │    │    ├── view/
 │    │    └── viewmodel/
 │    │
 │    └── analyze/
 │         ├── model/
 │         ├── view/
 │         └── viewmodel/
 │
 ├── shared/
```

---

## 🔍 Funcionalidades

### Mobile

* [x] Tela de login
* [x] Tela de análise de mensagens
* [ ] Upload de imagens (prints)
* [ ] Exibição de resultado com nível de risco (baixo, médio, alto)
* [ ] Explicação da análise (ex: link suspeito, urgência, etc.)
* [ ] Histórico de análises
* [ ] Alertas visuais de risco

### Backend / IA

* [ ] API para análise de mensagens
* [ ] Classificação de risco automatizada
* [ ] OCR (extração de texto de imagens)
* [ ] Base de dados de golpes
* [ ] Aprendizado contínuo da IA

---

## ⚙️ Tecnologias Utilizadas

### Frontend

* Flutter
* Dart

### Backend (planejado)

* Node.js
* Express

---

## ▶️ Como rodar o projeto

```bash
git clone https://github.com/seu-usuario/safe-radar.git
cd safe-radar
flutter pub get
flutter run
```

---


## 📌 Observação

Projeto acadêmico em evolução, desenvolvido em parceria com residência tecnológica.

---
