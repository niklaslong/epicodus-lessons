// Modules
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule }  from '@angular/forms';

// Pipes
import { CompletenessPipe } from './completeness.pipe';

// Components
import { AppComponent } from './app.component';
import { TaskListComponent } from './task-list.component';
import { EditTaskComponent } from './edit-task.component';
import { NewTaskComponent } from './new-task.component';

@NgModule({
  imports: [ BrowserModule, FormsModule ],
  declarations: [ AppComponent, TaskListComponent, EditTaskComponent, NewTaskComponent, CompletenessPipe ],
  bootstrap: [ AppComponent ]
})

export class AppModule { }
