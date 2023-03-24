
export type ClassInitialState = {
    classId: number | null;
    title: string;
    image: string;
    color: string;
  };
  
  export type FormClasses = {
    initialState: {
      author: string;
      initialClasses: ClassInitialState[];
      date: string;
      version: string;
      weeklyModifier: string;
    };
    waves: Wave[];
  };
  
  export type Wave = {
    spawn1: {
      spawnLocation: string;
      selectedOptions: ClassInitialState[];
      actions: string[];
      extra: string[];
      objective: string;
    };
    spawn2: {
      spawnLocation: string;
      selectedOptions: ClassInitialState[];
      actions: string[];
      extra: string[];
      objective: string;
    };
    spawn3: {
      spawnLocation: string;
      selectedOptions: ClassInitialState[];
      actions: string[];
      extra: string[];
      objective: string;
    };
  };