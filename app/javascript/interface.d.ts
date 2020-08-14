interface Work {
  id: number
  workContentId: number
  workPropertyId: number
  startAt: string
  endAt: string
  includeRest: boolean
}

interface WorkContent {
  id: number
  clientId: number
  name: string
  nameKana: string
  active: boolean
}

interface WorkProperty {
  id: number
  clientId: number
  name: string
  code: string
  active: boolean
}

interface Department {
  id: number
  clientId: number
  name: string
}
