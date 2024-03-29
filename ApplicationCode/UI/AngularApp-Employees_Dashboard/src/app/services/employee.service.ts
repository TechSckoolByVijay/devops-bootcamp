import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root',
})
export class EmployeeService {
  constructor(private _http: HttpClient) {}

  // private baseApiUrl = 'http://localhost:3000/employees';
  private baseApiUrl = environment.baseAPIUrl

  addEmployee(data: any): Observable<any> {
    return this._http.post(this.baseApiUrl, data);
  }

  updateEmployee(id: number, data: any): Observable<any> {
    return this._http.put(`${this.baseApiUrl}/${id}`, data);
  }

  getEmployeeList(): Observable<any> {
    return this._http.get(this.baseApiUrl);
  }

  deleteEmployee(id: number): Observable<any> {
    return this._http.delete(`${this.baseApiUrl}/${id}`);
  }
}
