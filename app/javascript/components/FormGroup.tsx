import React from 'react';

interface IFormGroup {
  label: string
  for: string
  required: boolean
  children: any
}

export const FormGroup = ({ label, for, children, required = false }: IFormGroup) => (
  <div className="form-group">
    {
      label
      && <label className={`form-label ${required ? 'required' : ''}`} for={for}>{label}</label>
    }
    {children}
  </div>
);
