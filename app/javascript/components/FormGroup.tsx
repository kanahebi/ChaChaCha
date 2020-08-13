import React from 'react';

interface IFormGroup {
  label?: string
  required?: boolean
  children: any
}

export const FormGroup = ({ label, children, required = false }: IFormGroup) => (
  <div className="form-group">
    <label>
      {
        label
        && <div className={`form-label ${required ? 'required' : ''}`}>{label}</div>
      }
      {children}
    </label>
  </div>
);

interface IFormGroupToggle {
  label?: string
  required?: boolean
  children: any
}

export const FormGroupToggle = ({ label, children, required = false }: IFormGroupToggle) => (
  <div className="form-group toggle">
    <label className="form-group-inner">
      {children}
      {
        label
        && <div className={`form-label ${required ? 'required' : ''}`}>{label}</div>
      }
    </label>
  </div>
);
