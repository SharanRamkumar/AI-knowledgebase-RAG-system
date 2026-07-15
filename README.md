# AI Knowledge Base RAG System using n8n, Supabase and OpenAI
![n8n](https://img.shields.io/badge/n8n-workflow-EA4B71?logo=n8n&logoColor=white)
![OpenAI](https://img.shields.io/badge/OpenAI-GPT--4o--mini-412991?logo=openai&logoColor=white)
![Supabase](https://img.shields.io/badge/Supabase-Vector%20Store-3ECF8E?logo=supabase&logoColor=white)
![pgvector](https://img.shields.io/badge/pgvector-Embeddings-4169E1?logo=postgresql&logoColor=white)
![License](https://img.shields.io/badge/license-MIT-green)
![RAG](https://img.shields.io/badge/RAG-Retrieval%20Augmented%20Generation-blue)
![Status](https://img.shields.io/badge/status-production--ready-brightgreen)

## Overview

This project is a Retrieval-Augmented Generation (RAG) based Business Knowledge Base Chatbot built using n8n, OpenAI, and Supabase Vector Store. The system allows users to ask questions in natural language while restricting responses strictly to the information available in the knowledge base.

The chatbot performs semantic search on vector embeddings stored in Supabase and generates context-aware responses using OpenAI models. Documents can be dynamically ingested into the knowledge base using a webhook endpoint and are automatically chunked before being embedded and stored.

This project demonstrates the implementation of:

* Retrieval-Augmented Generation (RAG)
* Semantic Search
* OpenAI Embeddings
* Supabase Vector Database
* n8n AI Agents
* Conversation Memory
* Webhook-based Document Ingestion
* Automatic Text Chunking
* Knowledge Base Restricted Responses
* SQL-based Vector Similarity Search

---

## Features

* AI-powered Business Knowledge Base Assistant
* Semantic Search using Vector Embeddings
* Automatic Document Chunking
* Dynamic Knowledge Base Updates
* Conversation Memory Support
* SQL-based Similarity Search using `match_documents()`
* Secure Knowledge Restricted Responses
* Modular n8n Workflows
* Supports Multiple Knowledge Base Documents
* Webhook-based Data Ingestion Pipeline

---

## Architecture

### Chat Workflow

```text
                    User
                      |
                      |
                   Chat
                      |
                      |
                  AI Agent
                      |
                 GPT-4o-mini
                      |
                Knowledge Tool
                      |
            Supabase Vector Store
                      |
              match_documents()
                      |
                   rag_docs
                      |
                Retrieved Context
                      |
                  OpenAI Model
                      |
                     Answer
                      |
                     User
```

### Document Ingestion Workflow

```text
                 JSON Input
                      |
                   Webhook
                      |
                Chunking Node
                      |
              Default Data Loader
                      |
               OpenAI Embeddings
                      |
             Supabase Vector Store
                      |
                   rag_docs
                      |
                Vector Embeddings
                      |
                   Stored
```

---

## Tech Stack

| Technology  | Purpose             |
| ----------- | ------------------- |
| n8n         | Workflow Automation |
| OpenAI      | LLM & Embeddings    |
| Supabase    | Vector Database     |
| PostgreSQL  | Storage Layer       |
| Postman     | API Testing         |
| GPT-4o-mini | Response Generation |
| SQL         | Similarity Search   |
| Webhooks    | Data Ingestion      |

---

## Project Structure

```text
n8n-RAG-System
│
├── workflows
│     ├── chatbot-workflow.json
│     └── ingestion-workflow.json
│
├── sql
│     ├── match_documents.sql
│     └── rag_docs_schema.sql
│
├── examples
│     ├── sample_input.json
│     └── sample_questions.txt
│
├── images
│     ├── workflow.png
│     ├── architecture.png
│     └── demo.png
```

---

## Knowledge Base Ingestion

Documents can be added dynamically using the ingestion webhook.

### Sample JSON

```json
{
    "source":"india-ai-market",
    "text":"Artificial Intelligence jobs are rapidly growing in India..."
}
```

The ingestion workflow automatically:

1. Receives the document.
2. Cleans the text.
3. Splits it into chunks.
4. Generates embeddings.
5. Stores vectors in Supabase.
6. Makes them immediately available for semantic search.

---

## Sample Questions

The chatbot can answer questions such as:

```text
What are the skills required for AI jobs in India?

Can web designers work remotely in India?

What is the average salary of AI Engineers?

Which industries hire Machine Learning Engineers?

What technologies are used in RAG systems?

What career opportunities are available in AI Automation?
```

---

## Database Schema

The project uses:

```text
rag_docs
--------
id
content
metadata
embedding
```

Similarity search is performed using:

```sql
match_documents()
```

which retrieves the most relevant document chunks based on vector similarity.

---

## System Prompt Design

The AI Agent is designed to:

* Always search the knowledge base first.
* Never answer using its own knowledge.
* Combine multiple retrieved chunks coherently.
* Restrict responses only to stored documents.
* Return fallback responses when no relevant information is available.

Fallback Response:

```text
I don't have that information.
Please contact us directly for more details.
```

---

## Installation

1. Clone the repository.

```bash
git clone https://github.com/YOUR_USERNAME/YOUR_REPOSITORY_NAME.git
```

2. Import the n8n workflows.

3. Configure:

* OpenAI API Key
* Supabase URL
* Supabase API Key

4. Create the required tables.

5. Create the SQL similarity search function.

6. Run the ingestion workflow.

7. Start asking questions.

---

## Future Improvements

* PDF Ingestion
* Website Scraping
* OCR Support
* Metadata Filtering
* Hybrid Search
* Redis Caching
* Multi-language Support
* Voice Assistant Integration
* AI Appointment Booking Systems
* Support for Multiple Knowledge Bases

---

## Security Notes

This repository does NOT contain:

* OpenAI API Keys
* Supabase API Keys
* Credentials
* Tokens
* Private Webhook URLs

Please configure your credentials locally before running the project.

---

## Learning Outcomes

This project demonstrates practical experience with:

* Retrieval-Augmented Generation (RAG)
* Semantic Search
* Vector Databases
* OpenAI Embeddings
* AI Agents using n8n
* Workflow Automation
* SQL-based Similarity Search
* Knowledge Base Engineering
* Prompt Engineering
* Context-aware AI Systems

---

## License

This project is licensed under the MIT License.

---

## Author

Developed as a portfolio project to demonstrate the implementation of production-style AI knowledge base systems using n8n, Supabase, and OpenAI.
