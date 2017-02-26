const arr = [ 1, 2, 3, 4, 5 ];

Array.prototype.duplicator = function () {
    const newArr = this.concat(this);
    return newArr;
};

function run()
{
    console.log(arr.duplicator());
}

export default {
    run
}
