if (variable_instance_exists(id, "status")) 
{
    // 2. Check for "Hide" status
    if (array_contains(status, "Hide")) 
    {
        // 3. Fade out (Lerp makes it smooth)
        // Target 0.5 alpha (50% invisible)
        image_alpha = lerp(image_alpha, 0.5, 0.1); 
    } 
    else 
    {
        // 4. Fade back to normal
        image_alpha = lerp(image_alpha, 1.0, 0.1);
    }
}