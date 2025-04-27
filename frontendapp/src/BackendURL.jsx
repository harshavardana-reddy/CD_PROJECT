const backendApi = import.meta.env.VITE_APP_BACKEND_URL
const BackendURL = {
    Main:`${backendApi}`,
    Admin:`${backendApi}/admin`,
    Seller:`${backendApi}/seller`,
    User:`${backendApi}/user`,
}
export default BackendURL;