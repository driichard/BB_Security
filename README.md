# 🛡️ Alerta Golpe — Banco do Brasil

Aplicativo mobile para detecção e prevenção de golpes digitais utilizando Inteligência Artificial.

---

## 🚀 Tecnologias

| Camada | Tecnologia |
|--------|-----------|
| Frontend | Flutter (Dart) |
| Backend | Node.js (API REST) |
| Banco de Dados | MySQL |
| Inteligência Artificial | Gemini API |
| Controle de Versão | Git e GitHub |
| Arquitetura Mobile | MVVM |

---

## 📐 Arquitetura do Sistema

```
[ App Flutter ]
      ↓
[ API Node.js ]
      ↓
[ Serviço de IA ]
      ↓
[ Banco de Dados MySQL ]
```

---

## 📂 Estrutura de pastas

```
lib/
├── core/
│   └── theme/
│       └── app_colors.dart
├── features/
│   ├── onboarding/view/splash_page.dart
│   ├── auth/
│   │   ├── view/login_page.dart
│   │   └── viewmodel/login_viewmodel.dart
│   ├── register/
│   │   ├── view/register_page.dart
│   │   └── viewmodel/register_viewmodel.dart
│   ├── forgot_password/
│   │   ├── view/forgot_password_page.dart
│   │   └── viewmodel/forgot_password_viewmodel.dart
│   ├── home/view/home_page.dart
│   ├── analyze_text/
│   │   ├── view/analyze_text_page.dart
│   │   └── viewmodel/analyze_text_viewmodel.dart
│   ├── upload_print/
│   │   ├── view/upload_print_page.dart
│   │   └── viewmodel/upload_print_viewmodel.dart
│   ├── result/view/result_page.dart
│   ├── history/view/history_page.dart
│   └── settings/view/settings_page.dart
└── main.dart
```

---

## 🖥️ Telas

| Tela | Descrição |
|------|-----------|
| Splash | Tela inicial com animação |
| Login | Autenticação do usuário |
| Cadastro | Criação de nova conta com CPF e aceite LGPD |
| Recuperar senha | Envio de link de redefinição por e-mail |
| Home | Dashboard com acesso rápido às funcionalidades |
| Análise de texto | Análise de mensagem suspeita pela IA |
| Upload de print | Envio de imagem para análise via OCR + IA |
| Resultado | Exibe nível de risco, motivos e dicas de segurança |
| Histórico | Lista de análises anteriores com filtros por risco |
| Configurações | Privacidade, notificações e conformidade LGPD |

---

## ▶️ Como rodar o projeto

**Pré-requisitos:**
- Flutter SDK instalado
- Android Studio ou Xcode configurado

**Passos:**

```bash
# Clone o repositório
git clone https://github.com/driichard/BB_Security.git

# Entre na pasta
cd BB_Security

# Instale as dependências
flutter pub get

# Rode o app
flutter run
```

**Credenciais de teste:**
```
E-mail: teste@bb.com
Senha:  123456
```

---

## 📦 Dependências

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.0.5
  image_picker: ^1.0.7
  cupertino_icons: ^1.0.8
```

---

## 📋 Requisitos Funcionais

| ID | Requisito |
|----|-----------|
| RF01 | Análise de mensagem de texto |
| RF02 | Classificação de risco: baixo, médio ou alto |
| RF03 | Explicação dos motivos da classificação |
| RF04 | Upload de print para análise |
| RF05 | OCR para extração de texto de imagens |
| RF06 | Histórico de análises do usuário |
| RF07 | Envio de dados anonimizados para melhoria da IA |
| RF08 | Alertas visuais claros e intuitivos |

---

## ⚙️ Requisitos Não Funcionais

- **Privacidade:** conformidade com a LGPD, processamento local prioritário
- **Performance:** tempo de resposta inferior a 3 segundos
- **Segurança:** criptografia de dados e proteção contra interceptação
- **Usabilidade:** interface simples e acessível
- **Escalabilidade:** backend modular preparado para múltiplos usuários

---

## 📊 Status do projeto

| Etapa | Status |
|-------|--------|
| Telas do app (Flutter) | ✅ Concluído |
| Integração com IA (Gemini API) | ✅ Concluído |
| OCR de imagens | ✅ Concluído |
| Backend Node.js | ✅ Concluído |
| Banco de dados MySQL | ✅ Concluído|
| Autenticação real | ✅ Concluído |

---

## 🔒 Privacidade e LGPD

- Processamento local prioritário
- Consentimento explícito do usuário no cadastro
- Anonimização de dados enviados para melhoria da IA
- Opção de exclusão completa dos dados pelo usuário

---

## 👨‍💻 Squad 39 — Banco do Brasil