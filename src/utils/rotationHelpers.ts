export const calculateCurrentVersion = (version: string) => {
    const convertVersionToNumber = Number(version)
    const currentVersion = convertVersionToNumber + 0.1

    return isFloat(currentVersion) ? currentVersion.toFixed(1).toString() : `${currentVersion}.0`
}

export const  isFloat = (value: number) =>  {
    if (
      typeof value === 'number' &&
      !Number.isNaN(value) &&
      !Number.isInteger(value)
    ) {
      return true;
    }
  
    return false;
  }

  