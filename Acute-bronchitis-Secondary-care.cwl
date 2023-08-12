cwlVersion: v1.0
steps:
  read-potential-cases-i2b2:
    run: read-potential-cases-i2b2.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  noninfectious-acute-bronchitis-secondary-care---secondary:
    run: noninfectious-acute-bronchitis-secondary-care---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-i2b2/output
  acute-bronchitis-secondary-care-streptococcu---secondary:
    run: acute-bronchitis-secondary-care-streptococcu---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: noninfectious-acute-bronchitis-secondary-care---secondary/output
  acute-bronchitis-secondary-care-rhinovirus---secondary:
    run: acute-bronchitis-secondary-care-rhinovirus---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: acute-bronchitis-secondary-care-streptococcu---secondary/output
  acute-bronchitis-secondary-care-coxsackievirus---secondary:
    run: acute-bronchitis-secondary-care-coxsackievirus---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: acute-bronchitis-secondary-care-rhinovirus---secondary/output
  acute-bronchitis-secondary-care-influenzae---secondary:
    run: acute-bronchitis-secondary-care-influenzae---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: acute-bronchitis-secondary-care-coxsackievirus---secondary/output
  acute-bronchitis-secondary-care-unspecified---secondary:
    run: acute-bronchitis-secondary-care-unspecified---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: acute-bronchitis-secondary-care-influenzae---secondary/output
  bronchitis---secondary:
    run: bronchitis---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: acute-bronchitis-secondary-care-unspecified---secondary/output
  acute-bronchitis-secondary-care---secondary:
    run: acute-bronchitis-secondary-care---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: bronchitis---secondary/output
  acute-bronchitis-secondary-care-pneumoniae---secondary:
    run: acute-bronchitis-secondary-care-pneumoniae---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: acute-bronchitis-secondary-care---secondary/output
  acute-bronchitis-secondary-care-echovirus---secondary:
    run: acute-bronchitis-secondary-care-echovirus---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: acute-bronchitis-secondary-care-pneumoniae---secondary/output
  chronic-acute-bronchitis-secondary-care---secondary:
    run: chronic-acute-bronchitis-secondary-care---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: acute-bronchitis-secondary-care-echovirus---secondary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: chronic-acute-bronchitis-secondary-care---secondary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
