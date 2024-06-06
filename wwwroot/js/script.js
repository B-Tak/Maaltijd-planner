document.getElementById('daysSelect').addEventListener('change', function ()
{
    const numberOfDays = parseInt(this.value);
    const loremContainer = document.getElementById('loremContainer');

    loremContainer.innerHTML = '';

    let i = 0;
    while (i < numberOfDays)
    {
            const div = document.createElement('div');
            div.setAttribute('class', 'Selectorbox');
            loremContainer.appendChild(div);
            i++;
    }
});