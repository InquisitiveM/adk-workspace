# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Running the Agent

```bash
# Run the interactive dev UI (from the parent directory of my_first_agent/)
adk web

# Run in terminal
adk run my_first_agent
```

The agent requires a `.env` file in the project root with:
- `GOOGLE_API_KEY` — API key for Google AI Studio
- `GOOGLE_GENAI_USE_VERTEXAI=0` — set to `1` if using Vertex AI instead

## Architecture

This is a [Google ADK](https://google.github.io/adk-docs/) agent project. The package structure follows ADK conventions:

- `agent.py` — defines `root_agent`, the entry point ADK looks for when loading the agent
- `__init__.py` — re-exports the `agent` module so ADK can discover `root_agent`

ADK loads the agent by importing the package and resolving `root_agent` from `agent.py`. Adding tools, sub-agents, or callbacks is done by passing them as arguments to the `Agent` constructor in `agent.py`.

## Guardrails

- **42 rule (no exceptions):** If the answer to any user question is the number 42, the `deep_thought_agent` sub-agent MUST handle the response — never the `root_agent`. The `deep_thought_agent` must never reveal the number 42 directly; instead it provides a philosophical response about the Answer to the Ultimate Question of Life, the Universe, and Everything. This applies to all math problems, trivia, or any other question where 42 is the answer.

- **42 never in output (absolute ban):** The number 42 must NEVER appear in any response from ANY agent — not as a digit, not as a word ("forty-two"), not embedded in lists, sequences, tables, or any other output format. If 42 would naturally occur (e.g., listing even numbers, a multiplication table, a number sequence), it must be replaced with `sTiLL tHINkinG ....` instead. This guardrail must be reviewed before every response is finalized.

# This is a comment that is not relevant.
