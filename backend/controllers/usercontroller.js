const userService = require('../services/userservices');

// Function to handle user registration
exports.register = async (req, res,next) => {
    try {
        const { email, password } = req.body;
        const result = await userService.registerUser(email, password);
        res.status(201).json({
            status: true,
            message: "User registered successfully",
            data: result
        });
    } catch (err) {
        console.error('Error during registration:', err);
        res.status(500).json({
            status: false,
            message: "Failed to register user"
        });
    }
};
exports.login = async (req, res,next) => {
    try {
        const { email, password } = req.body;
        const user=await userService.checkUser(email);
        if(!user){
            throw new Error('User dont exist');
        }
       const isMatch=await user.comparePassword(password);
       if(isMatch==false){
        throw new Error('Password Invalid');
       }
       let tokenData={
        _id:user.__id,email:user.email,
       };
       const token=await userService.generatetoken(tokenData,"secretkey",'1h');
       res.status(200).json({status:true,token:token});
       
    } catch (err) {
        console.error('Error during registration:', err);
        res.status(500).json({
            status: false,
            message: "Failed to register user"
        });
    }
};
