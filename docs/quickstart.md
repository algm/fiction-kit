# Quick Start Guide

This guide will help you get started with Fiction Kit for AI-assisted creative writing.

> All automation scripts provide both Bash (`.sh`) and PowerShell (`.ps1`) variants. The `fiction` CLI auto-selects based on OS unless you pass `--script sh|ps`.

## The 5-Step Process

### 1. Install Fiction CLI

Initialize your project depending on the AI agent you're using:

```bash
uvx --from git+https://github.com/github/fiction-kit.git fiction init <PROJECT_NAME>
```

Pick script type explicitly (optional):

```bash
uvx --from git+https://github.com/github/fiction-kit.git fiction init <PROJECT_NAME> --script ps  # Force PowerShell
uvx --from git+https://github.com/github/fiction-kit.git fiction init <PROJECT_NAME> --script sh  # Force POSIX shell
```

### 2. Establish Writing Principles

Use the `/fiction.principles` command to define your writing voice, style, and narrative rules:

```
/fiction.principles I write in third-person limited POV, past tense. 
My style is literary with focus on interiority and atmosphere. 
I avoid adverbs and prefer active voice. I write in Spanish.
```

### 3. Create Your Story Premise

Use the `/fiction.premise` command to describe your story concept. Focus on the **what** (conflict, characters, theme), not the technical details.

```
/fiction.premise A detective in 1920s Barcelona investigates murders connected 
to the anarchist movement. She discovers her own family is involved, forcing 
her to choose between justice and loyalty. It's a noir mystery with literary prose.
```

### 4. Develop Characters and World

Use `/fiction.character` and `/fiction.world` to build rich story elements:

```
/fiction.character Elena Vidal - the protagonist detective. Haunted by her father's 
mysterious death. She believes the lie that justice always prevails.

/fiction.world Barcelona 1920s - tension between aristocracy and workers, 
the gothic quarter's narrow streets, anarchist idealism and violence.
```

### 5. Outline, Scene, and Draft

Use `/fiction.outline` to create structure, then `/fiction.scenes` for scene breakdown, then `/fiction.draft` to write prose.

```
/fiction.outline Use beat-sheet methodology with noir tone. Three-week timeline.

/fiction.scenes

/fiction.draft Chapter 1
```

## Detailed Example: Building "La Detective de Barcelona"

Here's a complete example of building a Spanish literary noir novel:

### Step 1: Define Premises with `/fiction.premise`

```text
Desarrolla "La Detective de Barcelona", una novela noir ambientada en 1920. 
La protagonista, Elena Vidal, es una de las primeras mujeres detective de la ciudad. 
Investiga una serie de asesinatos conectados con el movimiento anarquista. 
Cuando descubre que su propia familia está involucrada, debe elegir entre la justicia 
y la lealtad. La historia explora temas de identidad, clase social y el coste de la verdad.
```

### Step 2: Develop Characters

Create detailed character profiles:

```text
/fiction.character Elena Vidal - Protagonista, detective de 32 años. 
Hija de un abogado de clase alta que murió en circunstancias misteriosas. 
Su herida: cree que perdió a su padre por ser demasiado idealista.
Su mentira: que la justicia es absoluta y siempre prevalece.
Su verdad: que a veces la justicia requiere compromiso y perdón.
```

### Step 3: Build the World

```text
/fiction.world Barcelona 1920 - Una ciudad dividida entre la vieja aristocracia 
y el creciente movimiento obrero. El Raval con sus calles estrechas y bares de mala muerte. 
El Eixample con sus mansiones burguesas. La tensión entre el orden y la revolución.
Detalles sensoriales: el humo de los cigarrillos, el sonido de los tranvías, 
el olor del café y la pólvora.
```

### Step 4: Generate Outline with `/fiction.outline`

Be specific about your structure:

```text
/fiction.outline Utiliza la metodología beat-sheet con estructura de tres actos.
Acto I: Elena recibe el caso, descubre la conexión anarquista.
Punto medio: Descubre que su hermano está involucrado.
Acto II: Investiga mientras protege a su familia.
Acto III: Confrontación final, debe elegir entre justicia y familia.
Tono noir con momentos de belleza lírica.
```

### Step 5: Review and Implement

Have your AI agent review the outline for consistency:

```text
/fiction.review Check character motivations and timeline consistency.
Verify that the noir tone is maintained throughout.
```

Finally, begin drafting:

```text
/fiction.draft Chapter 1 - Focus on establishing Elena's character 
and the atmosphere of Barcelona. End with the inciting incident.
```

## Key Principles

- **Be explicit** about what you're writing and the emotional impact
- **Don't focus on plot mechanics** during premise phase—focus on character and theme
- **Iterate and refine** your story foundations before drafting
- **Validate** the outline before writing begins
- **Let the AI agent handle** the prose while you maintain creative vision

## Next Steps

- Read the complete workflow documentation for in-depth guidance
- Check out more examples in the repository
- Explore the available commands
