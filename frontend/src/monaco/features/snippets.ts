import type * as monaco from 'monaco-editor'

interface SnippetItem {
  label: string
  detail: string
  insertText: string
}

const COMMON_SNIPPETS: SnippetItem[] = [
  {
    label: 'for',
    detail: 'for loop',
    insertText: 'for (let ${1:i} = 0; ${1:i} < ${2:arr}.length; ${1:i}++) {\n\t${0}\n}',
  },
  {
    label: 'forr',
    detail: 'reverse for loop',
    insertText: 'for (let ${1:i} = ${2:arr}.length - 1; ${1:i} >= 0; ${1:i}--) {\n\t${0}\n}',
  },
  {
    label: 'while',
    detail: 'while loop',
    insertText: 'while (${1:condition}) {\n\t${0}\n}',
  },
  {
    label: 'if',
    detail: 'if statement',
    insertText: 'if (${1:condition}) {\n\t${0}\n}',
  },
  {
    label: 'dfs',
    detail: 'depth-first search',
    insertText:
      'function dfs(${1:node}) {\n\tif (${2:base}) return ${3:null};\n\t${0}\n\tfor (const ${4:next} of ${5:neighbors}) {\n\t\tdfs(${4:next});\n\t}\n}',
  },
  {
    label: 'bfs',
    detail: 'breadth-first search',
    insertText:
      'const queue = [${1:start}];\nwhile (queue.length) {\n\tconst ${2:cur} = queue.shift();\n\t${0}\n}',
  },
  {
    label: 'twoptr',
    detail: 'two pointers',
    insertText: 'let left = 0, right = ${1:arr}.length - 1;\nwhile (left < right) {\n\t${0}\n}',
  },
  {
    label: 'hashmap',
    detail: 'Map usage',
    insertText: 'const map = new Map<${1:string}, ${2:number}>();',
  },
]

const JAVA_SNIPPETS: SnippetItem[] = [
  {
    label: 'for',
    detail: 'for loop',
    insertText: 'for (int ${1:i} = 0; ${1:i} < ${2:arr}.length; ${1:i}++) {\n\t${0}\n}',
  },
  {
    label: 'while',
    detail: 'while loop',
    insertText: 'while (${1:condition}) {\n\t${0}\n}',
  },
  {
    label: 'if',
    detail: 'if statement',
    insertText: 'if (${1:condition}) {\n\t${0}\n}',
  },
  {
    label: 'hashmap',
    detail: 'HashMap',
    insertText: 'Map<${1:String}, ${2:Integer}> map = new HashMap<>();',
  },
  {
    label: 'pq',
    detail: 'PriorityQueue',
    insertText: 'PriorityQueue<${1:Integer}> pq = new PriorityQueue<>();',
  },
]

const PYTHON_SNIPPETS: SnippetItem[] = [
  {
    label: 'for',
    detail: 'for loop',
    insertText: 'for ${1:i} in range(${2:n}):\n\t${0}',
  },
  {
    label: 'while',
    detail: 'while loop',
    insertText: 'while ${1:condition}:\n\t${0}',
  },
  {
    label: 'if',
    detail: 'if statement',
    insertText: 'if ${1:condition}:\n\t${0}',
  },
  {
    label: 'dfs',
    detail: 'depth-first search',
    insertText: 'def dfs(${1:node}):\n\tif ${2:base}:\n\t\treturn ${3:None}\n\t${0}',
  },
]

function getSnippets(language: string): SnippetItem[] {
  if (language === 'java') {
    return JAVA_SNIPPETS
  }
  if (language === 'python') {
    return PYTHON_SNIPPETS
  }
  if (language === 'javascript' || language === 'typescript') {
    return COMMON_SNIPPETS
  }
  return []
}

let providerRegistered = false

export function registerOjSnippets(monacoApi: typeof monaco) {
  if (providerRegistered) {
    return
  }
  providerRegistered = true

  const languages = ['java', 'javascript', 'typescript', 'python']
  for (const language of languages) {
    monacoApi.languages.registerCompletionItemProvider(language, {
      triggerCharacters: ['.'],
      provideCompletionItems(model, position) {
        const word = model.getWordUntilPosition(position)
        const range = {
          startLineNumber: position.lineNumber,
          endLineNumber: position.lineNumber,
          startColumn: word.startColumn,
          endColumn: word.endColumn,
        }

        const suggestions = getSnippets(language).map((snippet) => ({
          label: snippet.label,
          kind: monacoApi.languages.CompletionItemKind.Snippet,
          detail: snippet.detail,
          insertText: snippet.insertText,
          insertTextRules: monacoApi.languages.CompletionItemInsertTextRule.InsertAsSnippet,
          range,
        }))

        return { suggestions }
      },
    })
  }
}
