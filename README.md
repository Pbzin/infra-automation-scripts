# 🚀 Infra Automation Scripts

Automação de rotinas de infraestrutura com PowerShell, focado em otimização de ambientes corporativos e servidores de alta densidade.

---

## 📂 Case Study: Otimização de Storage e Rede (Google Chrome em TS)

### 🚩 O Problema
Em ambientes de **Terminal Service (TS)**, o Google Chrome tornou-se um grande vilão de storage. Identifiquei perfis de usuários ocupando entre **1.7GB a 3GB** cada. Em um cenário com muitos usuários, isso exaure rapidamente o storage de alta performance.

### 🔍 A Investigação
Identifiquei 6 pastas principais como as maiores consumidoras de espaço:
* `OptGuideOnDeviceModel`, `optimization_guide_model_store` e `OnDeviceHeadSuggestModel` (Modelos de IA/Predição).
* `Cache`, `Code Cache` e `GPUCache`.

### 💡 A Solução Híbrida
Ao tentar apagar as pastas de modelos de IA, percebi que a solução era paliativa: no dia seguinte, o Chrome baixava tudo novamente, congestionando ("topando") a rede da empresa. 

Para resolver isso de forma definitiva, dividi o problema em duas frentes:

1. **Camada de Política (GPO/ADMX):** Padronizei modelos ADMX para **Chrome, Edge e Firefox**. Desativei recursos desnecessários e serviços de predição, impedindo o download automático dos modelos e otimizando a experiência do usuário.
2. **Camada de Automação (PowerShell):** Desenvolvi um script que percorre a pasta raiz do navegador, identifica a existência de múltiplos perfis e realiza a limpeza seletiva das pastas de `Cache`, `Code Cache` e `GPUCache`, que não impactam a rede nem a usabilidade.

> **Nota:** Este é um cenário específico para atender necessidades de infraestrutura compartilhada. Lembre-se: cada caso é um caso!

---

## 🛠️ Scripts Disponíveis

### 🧹 [Limpeza de Cache Multi-Perfil](./CacheCleanup-Chrome.ps1)
* **Finalidade:** Manutenção de espaço em disco em servidores TS/Multi-usuário.
* **Diferencial:** Varredura dinâmica em todos os perfis do Browser dentro do perfil do Windows.

---

## 👨‍💻 Tecnologias Utilizadas
* **PowerShell** (Automação de limpeza)
* **Modelos ADMX / GPO** (Governança e controle de rede)
* **Windows Server 

---
*Mantido por [Pablo Vinicius](https://github.com/Pbzin)*
